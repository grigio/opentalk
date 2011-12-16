module Talks
  class VoteBoxView < Poirot::View
    def id
      @talk.id
    end

    def toggle_vote_link
      toggle_vote_talk_url(@talk)
    end
  end
end
