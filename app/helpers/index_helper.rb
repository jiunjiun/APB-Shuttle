module IndexHelper
  def kind_enum(note)
    case note
    when 1
      t('note_enum.master')
    when 2
      t('note_enum.safety')
    when 3
      t('note_enum.security')
    when 4
      t('note_enum.orange')
    end
  end
end
