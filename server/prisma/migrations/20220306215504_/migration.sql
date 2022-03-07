-- CreateTable
CREATE TABLE "chats" (
    "id" BIGSERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "message" TEXT NOT NULL,
    "chatterid" BIGINT NOT NULL,

    CONSTRAINT "chats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "chatters" (
    "id" BIGSERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "color" TEXT NOT NULL DEFAULT E'#FFFFFF',
    "username" TEXT NOT NULL,

    CONSTRAINT "chatters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "follows" (
    "id" BIGSERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "chatterid" BIGINT NOT NULL,

    CONSTRAINT "follows_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subs" (
    "id" BIGSERIAL NOT NULL,
    "created_at" TIMESTAMPTZ(6) DEFAULT CURRENT_TIMESTAMP,
    "recipient" TEXT,
    "tier" SMALLINT NOT NULL,
    "months" BIGINT NOT NULL,
    "chatterid" BIGINT NOT NULL,

    CONSTRAINT "subs_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "chatters_username_key" ON "chatters"("username");

-- AddForeignKey
ALTER TABLE "chats" ADD CONSTRAINT "chats_chatterid_fkey" FOREIGN KEY ("chatterid") REFERENCES "chatters"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "follows" ADD CONSTRAINT "follows_chatterid_fkey" FOREIGN KEY ("chatterid") REFERENCES "chatters"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subs" ADD CONSTRAINT "subs_chatterid_fkey" FOREIGN KEY ("chatterid") REFERENCES "chatters"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "subs" ADD CONSTRAINT "subs_recipient_fkey" FOREIGN KEY ("recipient") REFERENCES "chatters"("username") ON DELETE NO ACTION ON UPDATE NO ACTION;
