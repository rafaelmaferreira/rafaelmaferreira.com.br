#!/usr/bin/env ruby
#
# Check for changed posts

Jekyll::Hooks.register :posts, :post_init do |post|

  # Get the number of commits for the post
  commit_num = `git rev-list --count HEAD "#{post.path}"`.to_i

  # If the post has more than one commit, update the last modified date
  if commit_num > 1
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{post.path}"`.strip
    post.data['last_modified_at'] = lastmod_date
  end

end
