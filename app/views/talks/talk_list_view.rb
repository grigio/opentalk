# -*- encoding : utf-8 -*-
module Talks
  class TalkListView < Poirot::View

  	def pippo
  		talks.to_json
  	end

	end
end
