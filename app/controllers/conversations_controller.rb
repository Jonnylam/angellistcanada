class ConversationsController < ApplicationController
  # before_action :load_user
	# before_filter :authenticate_user!
   helper_method :mailbox, :conversation

   before_action :mailbox


  def create
    recipient_emails = conversation_params(:recipients).split(',')
    recipients = User.where(email: recipient_emails).all

    conversation = current_user.send_message(recipients, *conversation_params(:body, :subject)).conversation
  end

  def index
    @conversations ||= @mailbox.conversations
    @conversationscount ||= current_user.mailbox.inbox.all
    # @trash ||= current_user.mailbox.trash.all
  end


  def reply
    current_user.reply_to_conversation(conversation, params[:body])
    redirect_to conversation_path(@conversation)
  end

  # def trash
  #   conversation.move_to_trash(current_user)
  #   redirect_to :conversations
  # end

  def show
    @conversation ||= @mailbox.conversations.find(params[:id])
    # conversation.mark_as_read(current_user)
  end

  # def untrash
  #   conversation.untrash(current_user)
  #   redirect_to :back
  # end

  #  def trashbin
  #   @conversations ||= @mailbox.inbox
  #   @conversationscount ||= current_user.mailbox.inbox.all
  #   @trash ||=  current_user.mailbox.trash
  #   @trashcount ||= @mailbox.trash.all
  # end

  # def empty_trash
  #   current_user.mailbox.trash.each do |conversation|
  #     conversation.receipts_for(current_user).update_all(:deleted => true)
  #   end
  #  redirect_to :conversations
  # end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  private
  # def load_user
  #   @user = current_user
  # end
end