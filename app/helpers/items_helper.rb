module ItemsHelper
  def show_item_image(item)
    if item.image.attached?
      image_tag item.image.variant(resize: "300x300"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail"
    end
  end
end
