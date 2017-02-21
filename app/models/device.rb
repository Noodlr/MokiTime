class Device < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :software
  belongs_to :location
  
  filterrific(
    default_filter_params: {},
    available_filters: [
      :search_query,
      :with_comments
    ]
  )
  
  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 1
    where(
      terms.map {
        or_clauses = [
          "LOWER(devices.name) LIKE ?",
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }
  
  scope :with_comments, lambda{ |state|
    return nil if state == 0
    
    where(needs_to_be_contacted: true)
  }
  
end
