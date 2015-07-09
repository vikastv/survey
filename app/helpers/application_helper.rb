module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def build_number_field(question_id)
    tag(:input, :type => "number", :name =>"q[#{question_id}]", :id => "question_number")
  end

  def build_text_field(question_id)
    tag(:input, :type => "text", :name => "q[#{question_id}]", :id => "question_text")
  end

  def build_date_field(question_id)
    tag(:input, :class => "ui-date-picker hasDatepicker", :id =>"question_date",:type => "text", :name => "q[#{question_id}]", :size => "30" )
  end
end
