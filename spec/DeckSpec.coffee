assert = chai.assert
expect = chai.expect

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  it "should have an intialize method", ->

    expect(deck.initialize).to.be.a('function')


  it "should have an dealPlayer method", ->

    expect(deck.dealPlayer).to.be.a('function')


  it "should have an dealDealer method", ->

    expect(deck.dealDealer).to.be.a('function')
