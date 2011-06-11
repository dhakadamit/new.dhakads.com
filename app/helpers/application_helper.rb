module ApplicationHelper

  def display_errors_for(field, errors)
    render(:partial => 'shared/field_error', :locals => {:errors => errors, :field => field}) if errors.key?(field)
  end
end
