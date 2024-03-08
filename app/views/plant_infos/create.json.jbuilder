json.plant_info_id @plant_info.id
json.info render(partial: 'shared/plantinfonew', locals: {plant_info: @plant_info}, formats: [:html])