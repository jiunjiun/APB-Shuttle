module Admin::OrangesHelper
  def note_option_for_select
    [
      [t('note_enum.t2_2_t1'), t('note_enum.t2_2_t1')],
      [t('note_enum.t1_2_apb'), t('note_enum.t1_2_apb')]
    ]
  end

  def h_oranges_url(orange)
    if orange.new_record?
      admin_oranges_path(orange)
    else
      admin_orange_path(orange)
    end
  end
end
