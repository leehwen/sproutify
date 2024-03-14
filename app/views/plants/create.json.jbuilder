json.status @plant.valid?
json.info render(partial: 'addplantform', locals: {plant: @plant}, formats: [:html])