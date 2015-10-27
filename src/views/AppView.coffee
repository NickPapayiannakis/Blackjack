class window.AppView extends Backbone.View
  template: _.template '
    <div class="l-board">
    <ul class="m-controls"><li class="m-button hit-button">Hit</li> <li class="m-button stand-button">Stand</li></ul>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    </div>
  '

  events:
    'click .hit-button': ->
      @model.get('playerHand').hit()
      @model.get('dealerHand').hit()

    'click .stand-button': ->
      @model.get('playerHand').stand()
      @model.get('dealerHand').stand()


  initialize: ->
    @render()
    @model.on 'change:winner', =>
      alert @model.get('winner') + ' Wins!'

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
