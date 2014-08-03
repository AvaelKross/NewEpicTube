module JsonApiHelpers
  private

  def json_response
    @json_response ||= JSON.parse(response.body)
  end

  def auth_header(user)
    ActionController::HttpAuthentication::Token.encode_credentials(user.auth_token)
  end

  def json_result
    json_response['result']
  end

  def json_obj(obj, params)
    owner_json = {
      "id" => obj.ownerable_id,
      "slug" => obj.ownerable.try(:slug),
      "type" => obj.ownerable_type,
      "name" => obj.ownerable.try(:name),
      "picture_mini" => obj.ownerable.try(:picture_url, :mini)
    }

    obj.as_json(:only => params).merge("owner" => owner_json)
  end

  def simple_json_obj(obj, params)
    obj.as_json(:only => params)
  end

  def membership_json_obj(obj, membership_params)
    tmp_json = simple_json_obj(obj, membership_params)
    tmp_json["name"] = obj.user.name
    tmp_json["slug"] = obj.user.slug
    tmp_json["avatar"] = obj.user.picture_url(:mini)
    tmp_json
  end

  def category_json(cat, user)
    {
      "id" => cat.id,
      "slug" => cat.slug,
      "title" => cat.title,
      "subscribed" => user.subscribed_to?(cat),
      "picture" => cat.picture_url(:normal)
    }
  end
end