json.options render(partial: "offers/options", formats: :html, locals: {offer: @offer})

if @offer.buyer_plant.image.key?
  json.swap_image cl_image_path(@offer.buyer_plant.image.key)
  # json.swap_image Cloudinary::Utils.cloudinary_url("v1/#{ENV['RAILS_ENV']}/#{@offer.buyer_plant.image.key}")
else
  json.swap_image image_path(@offer.buyer_plant.plant_info.image_url)
end
