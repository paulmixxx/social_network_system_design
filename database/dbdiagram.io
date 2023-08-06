Table user {
  id integer
}

Table profile {
  id integer [primary key]
  user_id integer [ref: - user.id]
  name varchar
  description text
  photo_id integer [ref: - media_image.id]
  city_id integer [ref: - city.id]
  created_at datetime
  updated_at datetime
  deleted_at datetime [null]
}

Table city {
  id integer [primary key]
  name varchar
}

Table interest {
  id integer [primary key]
}

Table profile_interest {
  profile_id integer [ref: > profile.id]
  interest_id integer [ref: > interest.id]
}

Table post {
  id integer [primary key]
  author_id integer [ref: > user.id]
  description text
  body text
  created_at datetime
  updated_at datetime
  deleted_at datetime [null]
}

Table post_media_image {
  post_id integer [ref: > post.id]
  media_id integer [ref: - media_image.id]
}

Table post_media_audio {
  post_id integer [ref: > post.id]
  media_id integer [ref: - media_audio.id]
}

Table post_media_video {
  post_id integer [ref: > post.id]
  media_id integer [ref: - media_video.id]
}

Table hashtag {
  id integer [primary key]
  name varchar
}

Table post_hashtag {
  post_id integer [ref: > post.id]
  hashtag_id integer [ref: > hashtag.id]
}

Table post_likes {
  post_id integer [ref: - post.id]
  user_id integer [ref: - user.id]
  created_at datetime
}

Table post_views {
  post_id integer [ref: > post.id]
  user_id integer [ref: > user.id]
  created_at datetime
}

Table post_comment {
  id integer [primary key]
  post_id integer [ref: > post.id]
  comment_parent integer [ref: - post_comment.id]
  body text
  created_at datetime
  updated_at datetime
  deleted_at datetime [null]
}

Table conversation {
  id integer [primary key]
  created_at datetime
  updated_at datetime
  deleted_at datetime [null]
}

Table conversation_user {
  conversation_id integer [ref: > conversation.id]
  user_id integer [ref: > user.id]
}

Table message {
  id integer [primary key]
  conversation_id integer [ref: > conversation.id]
  body text
  created_at datetime
  updated_at datetime
  deleted_at datetime [null]
}

Table message_viewed {
  message_id integer [ref: > message.id]
  user_id integer [ref: > user.id]
  created_at datetime
}

Table friends {
  user_id integer [ref: > user.id]
  friend_id integer [ref: > user.id]
}

Table followers {
  user_id integer [ref: > user.id]
  follower_id integer [ref: > user.id]
}

enum relation_status {
    not_married
    dating
    engaged
    married
    civil_marriage
    inlove
    all_hard
    active_search
}

Table relationships {
  user_id integer [ref: > user.id]
  relation_user_id integer [ref: > user.id]
  status relation_status
}

Table media_image {
  id integer [primary key]
  name varchar
  original_url varchar
  thumbnail_small_url varchar
  thumbnail_medium_url varchar
  thumbnail_large_url varchar
  byte_size_small integer
  byte_size_medium integer
  byte_size_large integer
  created_at datetime
}

Table media_audio {
  id integer [primary key]
  name varchar
  url varchar
  byte_size integer
  created_at datetime
}

Table media_video {
  id integer [primary key]
  name varchar
  url varchar
  byte_size integer
  created_at datetime
}
