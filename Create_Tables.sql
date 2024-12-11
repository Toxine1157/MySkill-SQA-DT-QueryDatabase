create type "attendance_type" as enum (
	'clock-in',
	'clock-out'
);

create table "user" (
	"id" uuid primary key,
	"name" text not null,
	"address" text not null,
	"phone_number" text,
	"email" text not null,
	"password" text not null,
	"created_at" timestamptz default (CURRENT_TIMESTAMP),
	"created_by" uuid not null,
	"updated_at" timestamptz default (CURRENT_TIMESTAMP),
	"updated_by" uuid not null,
	"deleted_at" timestamptz,
	"deleted_by" uuid
);

create table "attendance" (
	"id" BIGSERIAL not null,
	"user_id" uuid not null,
	"date" timestamptz not null,
	"type" attendance_type not null,
	"created_at" timestamptz not null default (CURRENT_TIMESTAMP),
	"created_by" uuid not null,
	"updated_at" timestamptz not null default (CURRENT_TIMESTAMP),
	"updated_by" uuid not null
);

create table "session" (
	"id" BIGSERIAL not null,
	"session_id" text not null,
	"user_id" uuid not null,
	"expired_at" timestamptz not null
);

comment on column "user"."id" is 'ID dari user';

comment on column "user"."name" is 'Nama dari user';

comment on column "user"."address" is 'Alamat user';

comment on column "user"."phone_number" is 'Nomor handphone user';

comment on column "user"."email" is 'Email user';

comment on column "user"."created_at" is 'Timestamp dimana row ini dibuat';

comment on column "user"."created_by" is 'Pembuat dari data ini';

comment on column "user"."updated_at" is 'Timestamp dimana row ini diupdate';

comment on column "user"."updated_by" is 'User yang terakhir mengupdate row ini';

comment on column "user"."deleted_at" is 'Timestamp dimana row ini di hapus (soft delete)';

comment on column "user"."deleted_by" is 'user yang menghapus row atau data ini';

comment on column "attendance"."id" is 'Id dari row ini';

comment on column "attendance"."user_id" is 'User Id yang melakukan kehadiran';

comment on column "attendance"."created_at" is 'Timestamp dimana row ini dibuat';

comment on column "attendance"."created_by" is 'User yang membuat row ini';

comment on column "attendance"."updated_at" is 'Timestamp dimana row ini di update';

comment on column "attendance"."updated_by" is 'User yang terakhir mengupdate row ini';

comment on column "session"."id" is 'Id dari row ini';

comment on column "session"."session_id" is 'ID dari session';

comment on column "session"."user_id" is 'UserID yang memiliki session ini';

comment on column "session"."expired_at" is 'Timestamp expire untuk session ini';

alter table "attendance" add foreign key ("user_id") references "user" ("id");

alter table "session" add foreign key ("user_id") references "user" ("id");