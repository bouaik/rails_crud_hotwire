class Post < ApplicationRecord
  # broadcasts_to ->(post) { :posts_list }

  # after_create_commit { broadcast_append_to :posts_list }
  # after_update_commit { broadcast_replace_to :posts_list }
  # after_destroy_commit { broadcast_remove_to :posts_list }

   after_create_commit do
    broadcast_append_to :posts_list, target: "all_posts", partial: "posts/post", locals: {post: self}
    # update_post_count
  end

   after_update_commit do
    broadcast_replace_to :posts_list, target: self, partial: "posts/post", locals: {post: self}
   end


   after_destroy_commit do
    broadcast_remove_to :posts_list, target: self
    update_post_count
   end


   def update_post_count
    broadcast_update_to :posts_list, target: "posts_count", html: Post.count
   end

end
