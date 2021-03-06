class Api::ShortenerController < Api::BaseApiController
  OSIZE = 100 
  def resolve
    site = Shortcode.find_by_code(params[:code])
    if site.present?
      site.update_attributes(occurrences: (0 || site.occurrences))
      render json: {
        success: true,
	url: site.url
      }
    else
      render json: {
        success: false,
        message: 'Not found'
      }
    end
  end

  def index
    tops = Shortcode.all.where('occurrences is not NULL').order(occurrences: :desc).take(OSIZE)
    render json: {
      success: true,
      urls: tops
    }
  end

  def create
    sc = Shortcode.new(shortcode_params)

    if sc.valid? && sc.save!
      render json: {
        success: true,
	shortcode: sc
      }
    else
      render json: {
        success: false,
	errors: sc.errors.full_messages
      }
    end
  end

  private

  def shortcode_params
    params.require(:shortcode).permit(:code, :url)
  end
end
