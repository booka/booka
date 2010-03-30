module DisqsHelper
  def disq_types_collection
    collection = {}
    Disq::TYPES.each {|t| collection[t("disqs.types.#{t}")] = t}
    collection
  end
end
