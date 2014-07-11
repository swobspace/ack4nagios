module AcknowledgesHelper
  def show_state(state)
    st = state.to_s.upcase
    raw(%Q[<td class="#{st}">#{st}</td>])
  end
end
