class Api::ShortenerController < Api::BaseApiController
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
    tops = Shortcode.all.order(occurrences: :desc)
    render json: {
      success: true,
      urls: tops
    }
  end
end
