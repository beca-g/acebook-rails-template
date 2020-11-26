class ApplicationResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder

  protected 
  
  def json_resource_errors
    {
      success: false,
      errors: MyApplicationErrorFormatter.call(resource.errors)
    }
  end

  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder
end
