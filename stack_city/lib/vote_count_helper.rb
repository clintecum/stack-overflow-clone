module VoteCountHelper
    def vote_count
        sum = 0
        self.votes.map {|v| sum += v.value}
        sum
    end
end
