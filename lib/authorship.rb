module Scriptum
  class Authorship
    def self.change(original_user, new_user)
      Post.collection.update(
        { "user_id" => original_user.id },
        { "$set"    => { "user_id" => new_user.id } },
        :multi => true)
    end
  end
end
