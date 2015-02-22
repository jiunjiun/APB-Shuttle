json.info do
  json.apb do
    json.original do
      json.name         @apb_img.name
      json.size         @apb_img.size
      json.content_type @apb_img.content_type
      json.updated_at   @apb_img.updated_at
    end
    json.imgs_url do
      json.original "#{root_url[0..-2]}#{@apb_img.file_url}"
      json.desktop "#{root_url[0..-2]}#{@apb_img.file_url(:desktop)}"
      json.tablet "#{root_url[0..-2]}#{@apb_img.file_url(:tablet)}"
      json.mobile "#{root_url[0..-2]}#{@apb_img.file_url(:mobile)}"
    end
  end

  json.orange do
    json.ref_img @bus_img.link
    json.ref_link @ref_link.link
  end
end
json.status do
  json.code 200
  json.message 'ok'
end