class PlantInfosController < ApplicationController
  before_action :skip_authorization

  def new

  end

  def create
    @plant_info = PlantInfo.new
    mock_data = {
          "id": "ad11b3384dd5c143",
          "name": "Monstera deliciosa",

          "probability": 0.831,
          "similar_images": [
              {
                  "id": "1f72990944b8124dfbc2b8ff63ff1cd7e4f209e6",
                  "url": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/3/1f7/2990944b8124dfbc2b8ff63ff1cd7e4f209e6.jpeg",
                  "similarity": 0.58,
                  "url_small": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/3/1f7/2990944b8124dfbc2b8ff63ff1cd7e4f209e6.small.jpeg"
              },
              {
                  "id": "6abd81ab476605ea22d25260e9915f7154358354",
                  "url": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/3/6ab/d81ab476605ea22d25260e9915f7154358354.jpeg",
                  "license_name": "CC BY-SA 4.0",
                  "license_url": "https://creativecommons.org/licenses/by-sa/4.0/",
                  "citation": "annick rogeron",
                  "similarity": 0.572,
                  "url_small": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/3/6ab/d81ab476605ea22d25260e9915f7154358354.small.jpeg"
              }
          ],
          "details": {
              "common_names": [
                  "tarovine",
                  "Swiss Cheese Plant",
                  "Mexican Breadfruit",
                  "Windowleaf Philodendron",
                  "Monstera",
                  "Fruit salad plant",
                  "Delicious Monster",
                  "Ceriman"
              ],
              "description": {
                  "value": "Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama. It has been introduced to many tropical areas, and has become a mildly invasive species in Hawaii, Seychelles, Ascension Island and the Society Islands. It is very widely grown in temperate zones as a houseplant.\nThe common name \"Swiss cheese plant\" is also used for the related species from the same genus, Monstera adansonii. The common name \"split-leaf philodendron\" is also used for the species Thaumatophyllum bipinnatifidum, although neither species are in the genus Philodendron.",
                  "citation": "https://en.wikipedia.org/wiki/Monstera_deliciosa",
                  "license_name": "CC BY-SA 3.0",
                  "license_url": "https://creativecommons.org/licenses/by-sa/3.0/"
              },
              "image": {
                  "value": "https://plant-id.ams3.cdn.digitaloceanspaces.com/knowledge_base/wikidata/fbf/fbf5241269019c03b728e7836c7ab87962404b85.jpg",
                  "citation": "https://commons.wikimedia.org/wiki/File:Monstera_deliciosa2.jpg",
                  "license_name": "CC BY-SA 3.0",
                  "license_url": "https://creativecommons.org/licenses/by-sa/3.0/"
              },
              "watering": {
                  "max": 2,
                  "min": 2
              },
              "propagation_methods": [
                  "cuttings",
                  "seeds"
              ],
              "language": "en",
              "entity_id": "ad11b3384dd5c143"
          }
      }

    @data = Rails.env.development? ? mock_data : params[:data]

    # @data = params[:data]
    @name= @data[:name]
    @common_names = @data[:details][:common_names].first(3).join(",") unless @data[:details][:common_names].nil?
    @description = @data[:details][:description][:value]
    @image_url = @data[:details][:image][:value] unless @data[:details][:image][:value].nil?
    @propagation = @data[:details][:propagation_methods] unless @data[:details][:propagation_methods].nil?
    if @data[:details][:watering].nil?
      @watering = 0
    else
      @watering = @data[:details][:watering][:min].to_i
    end

    @plant_info = PlantInfo.find_or_initialize_by(
      name: @name
    )

    @plant_info.common_names = @common_names
    @plant_info.description = @description
    @plant_info.image_url = @image_url
    @plant_info.propagation = @propagation
    @plant_info.watering = @watering
    @plant_info.save

    respond_to do |format|
      format.json
      # format.text { render partial: "shared/plantinfonew", locals: {name: @name,
      # common_names: @common_names, description: @description, image_url: @image_url,
      # propagation: @propagation, watering: @watering}, formats: [:html] }
    end

  end

  def show
    @plant_info = PlantInfo.find_by(name: params[:id])
  end
end
