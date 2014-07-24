App.LeadController = Ember.ObjectController.extend

  showUnsavedMessage: ( ->
    @get('isDirty') and !@get('isSaving')
  ).property('isDirty', 'isSaving')

  isEditing: false 

  actions:
    saveChanges: -> @get('model').save() if @get('model.isDirty')

    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'leads'