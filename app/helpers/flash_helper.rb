module FlashHelper
  def register_flash_message(key, message)
    flash[key] = message
  end

  def register_flash_now_message(key, message)
    flash.now[key] = message
  end

  def display_flashes
    render 'shared/flash'
  end
end