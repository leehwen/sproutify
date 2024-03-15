json.plant_info_id
json.info render(partial: 'addcollection', locals: {collection: @collection}, formats: [:html])
json.status @collection.valid?
