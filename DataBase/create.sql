CREATE TABLE Users (
  id SERIAL PRIMARY KEY,
  telegram_id VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  verification_code INTEGER,
  profile_picture_url VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE BlockUser (
  blocker_user_id VARCHAR(255) NOT NULL,
  blocked_user_id VARCHAR(255) NOT NULL,
  ecreated_at TIMESTAMP NOT NULL,

  PRIMARY KEY (blocker_user_id, blocked_user_id),

  FOREIGN KEY (blocker_user_id) REFERENCES Users(telegram_id),
  FOREIGN KEY (blocked_user_id) REFERENCES Users(telegram_id)
);

CREATE TABLE Message (
  id SERIAL PRIMARY KEY,
  sender_id VARCHAR(255) NOT NULL,
  receiver_id VARCHAR(255) NOT NULL,
  message_type BYTEA,
  message_text TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  FOREIGN KEY (sender_id) REFERENCES Users(telegram_id),
  FOREIGN KEY (receiver_id) REFERENCES Users(telegram_id)
);

CREATE TABLE Channel (
  id SERIAL PRIMARY KEY,
  telegram_id VARCHAR(255) NOT NULL UNIQUE,
  title VARCHAR(255) NOT NULL,
  info VARCHAR(255),
  creator_id VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  FOREIGN KEY (creator_id) REFERENCES Users(telegram_id)
);

CREATE TABLE Groups (
  id SERIAL PRIMARY KEY,
  creator_id VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  join_url VARCHAR(255),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  FOREIGN KEY (creator_id) REFERENCES Users(telegram_id)
);

CREATE TABLE GroupMessage (
  id SERIAL PRIMARY KEY,
  group_id VARCHAR(255) NOT NULL,
  sender_id VARCHAR(255) NOT NULL,
  message_type BYTEA,
  message_text TEXT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  FOREIGN KEY (sender_id) REFERENCES Users(telegram_id)
);

CREATE TABLE ChannelMessage(
  id SERIAL PRIMARY KEY,
  channel_id VARCHAR(255) NOT NULL,
  message_type BYTEA,
  message_text TEXT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,

  FOREIGN KEY (channel_id) REFERENCES Channel(telegram_id)
);

CREATE TABLE MessageAttachment (
  message_id SERIAL PRIMARY KEY,
  attachment_url VARCHAR(255) NOT NULL,
  attachment_thumb_url VARCHAR(255) NOT NULL,

  FOREIGN KEY (message_id) REFERENCES Message(id)
);

CREATE TABLE GroupMessageAttachment (
  message_id SERIAL PRIMARY KEY,
  attachment_url TEXT NOT NULL, 
  attachment_thumb_url TEXT NOT NULL
);

CREATE TABLE ChannelMessageAttachment (
  message_id SERIAL PRIMARY KEY,
  attachment_url TEXT NOT NULL, 
  attachment_thumb_url TEXT NOT NULL
);

CREATE TABLE ChannelMembership (
  user_id VARCHAR(255) NOT NULL,
  channel_id VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL,

  PRIMARY KEY (user_id, channel_id),

  FOREIGN KEY (user_id) REFERENCES Users(telegram_id),
  FOREIGN KEY (channel_id) REFERENCES Channel(telegram_id)
);

CREATE TABLE GroupMembership (
  user_id VARCHAR(255) NOT NULL, 
  group_id VARCHAR(255) NOT NULL, 
  created_at TIMESTAMP NOT NULL,

  PRIMARY KEY (user_id, group_id),

  FOREIGN KEY (user_id) REFERENCES Users(telegram_id)
);


//////////////////////////////////////////////////////
drop table users cascade;
drop table BlockUser cascade;
drop table Message cascade;
drop table Channel cascade;
drop table Groups cascade;
drop table GroupMessage cascade;
drop table ChannelMessage cascade;
drop table MessageAttachment cascade;
drop table GroupMembership cascade;
drop table ChannelMembership cascade;
drop table GroupMessageAttachment;
drop table ChannelMessageAttachment;




