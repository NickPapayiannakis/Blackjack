assert = chai.assert
expect = chai.expect

describe 'hand', ->
  deck = null
  hand = null
  player = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    player = deck.dealPlayer()
    dealer = deck.dealDealer()

  describe 'Player Hand', ->
    it "should have a length of 2", ->
      assert.strictEqual player.length, 2

  describe 'Dealer Hand', ->
    it "should have a length of 2", ->
      assert.strictEqual dealer.length, 2


  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 48
      a = deck.last()
      player.hit()
      assert.strictEqual a, player.last()
      assert.strictEqual deck.length, 47

  describe 'stand', ->
    it 'should flip the dealer"s first card', ->
      dealer.stand()
      expect(dealer.models[0].get('revealed')).to.be.true
    it 'should deal out the dealers cards', ->
        expect(dealer.models.length).to.be.equal(2)
        dealer.stand()
        expect(dealer.models.length).to.be.at.least(2)

  describe 'minimum score', ->
    it 'should get the minimum score of the hand', ->
      expect(player.minScore()).to.be.a('number')
      expect(dealer.minScore()).to.be.a('number')
