class DiagnosisController < ApplicationController
  before_action :skip_authorization

  def diagnose

  end

  def results
    # @results = Rails.env.development? ? {
    #   name: "bacterial leaf",
    #   common_names: nil,
    #   cause: nil,
    #   description: "Bacterial leaf spot is caused by the bacteria Xanthomonas and Pseudomonas. Typical symptoms are black spots on the leaves or black-edged lesions and light and dark areas on the leaves, which usually develop on older leaves.",
    #   treatment: {
    #     "chemical": ["If necessary, apply fungicide containing azoxystrobin (GHS06: Toxic, GHS09: Environmental hazard).","If necessary, apply fungicide containing chlorothalonil (GHS05: Corrosive, GHS06: Toxic, GHS07: Harmful, GHS08: Health hazard, GHS09: Environmental hazard)."],
    #     "biological":["Remove weeds as well as all dead plant tissue. They may be a source of infection.","Apply ecological products for plant protection (e.g. copper-based spray)."],
    #     "prevention":["Use resistant species and cultivars as well as healthy, certified seeds and seedlings.","Avoid prolonged wetting of the leaves, which can be caused e.g. by overhead irrigation.","Improve the air circulation around the plant (e.g. by pruning excess foliage or increasing the spacing between plants).","Rotate crops. Avoid planting sensitive crops in infested soil.","Disinfect tools, infected flower pots, and hands to avoid disease transmission."]
    #   },
    #   image_url: "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/3/120/85e5ad1d14b6c0bba7e14e2f707158b0dfe77.jpg"
    #   } : params[:results]

    @results = params[:results]

    @illness = Illness.find_or_initialize_by(
      name: @results[:name]
    )

    @illness.common_names = @results[:common_names]
    @illness.cause = @results[:cause]
    @illness.description = @results[:description]
    @illness.treatment = @results[:treatment]
    @illness.image_url = @results[:image_url]
    @illness.save

    respond_to do |format|
      format.html
      format.text { render partial: "diagnosis_results", locals: {results: @results}, formats: [:html] }
    end
  end

  def addplants
    @plants = current_user.plants
    @illness = Illness.find(params[:add_plant][:illness_id])
  end
end
