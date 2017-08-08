module HomeHelper
    def badge_helper(num)
        case num
            when 0 then content_tag(:span, num, class: 'badge pull-right')
            when (1..4) then content_tag(:span, num, class: 'badge pull-right', style: "background-color: yellow;")
            else content_tag(:span, num, class: 'badge pull-right', style: "background-color: red;")
        end
    end
end
