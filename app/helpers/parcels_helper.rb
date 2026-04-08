module ParcelsHelper
  def status_badge(parcel)
    classes = case parcel.status.to_sym
    when :pending
                "bg-yellow-100 text-yellow-800"
    when :found
                "bg-blue-100 text-blue-800"
    when :awaiting_payment
                "bg-orange-100 text-orange-800"
    when :paid
                "bg-green-100 text-green-800"
    when :in_delivery
                "bg-purple-100 text-purple-800"
    when :delivered
                "bg-emerald-100 text-emerald-800"
    when :disputed
                "bg-red-100 text-red-800"
    end

    content_tag(:span, parcel.status.humanize,
      class: "px-3 py-1 rounded-full text-sm font-medium #{classes}")
  end
end
