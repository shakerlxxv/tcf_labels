module LabelDataHelper
  def empty_ness(str)
    str.nil? || str.empty? ? raw('&nbsp;') : str
  end
end
