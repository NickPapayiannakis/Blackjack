# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model

  defaults: {
    turn: 'player'
    winner: ''
  },

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()


    #set listener for change in score
    @get('playerHand').on 'all', =>
      @set 'playerScore', @get('playerHand').minScore()
      @checkScore('playerHand')

    @get('dealerHand').on 'stand', =>
      @set 'dealerScore', @get('dealerHand').minScore()
      @checkScore('dealerHand')
      @set @turn, 'dealer'
      @compareScore(@get('playerHand'), @get('dealerHand'))

  checkScore: (hand) ->
    if @get(hand).minScore() > 21
      @set 'winner', if hand is 'playerHand' then 'Dealer' else 'Player'
    else if @get(hand).minScore() is 21
      @set 'winner', if hand is 'playerHand' then 'Player' else 'Dealer'

  compareScore: (player, dealer) ->
    if player.minScore() > dealer.minScore()
      @set 'winner', 'Player'
    else if dealer.minScore() <= 21
      @set 'winner', 'Dealer'
    else if dealer.minScore() is player.minScore()
      @set 'winner', 'Dealer'
