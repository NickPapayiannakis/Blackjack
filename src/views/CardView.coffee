class window.CardView extends Backbone.View
  className: 'm-card'

  template: _.template '<img src=\"img/cards/<%= rank %>-<%= suitName %>.png\">'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'card-covered' unless @model.get 'revealed'
