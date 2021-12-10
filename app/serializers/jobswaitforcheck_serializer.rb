class JobswaitforcheckSerializer < ActiveModel::Serializer
  attributes(
     :id,
     :linked_id,
     :title,
     :company,
     :date,
     :required_skills,
     :link,
     :check_count
  )
end
