module Admin::BusesHelper
  def kind_enum(note)
    case note
    when 1
      t('note_enum.master')
    when 2
      t('note_enum.safety')
    when 3
      t('note_enum.security')
    end
  end

  def kind_option_for_select
    [
      [t('note_enum.master'), '1'],
      [t('note_enum.safety'), '2'],
      [t('note_enum.security'), '3']
    ]
  end
end
