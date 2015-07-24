module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do

        (parts << "Whiteboard").join(" - ")
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
    # only run code in the block if currrent_user.try(:admin) = true
  end
end
