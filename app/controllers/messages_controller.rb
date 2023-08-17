class MessagesController < ApplicationController
  before_action :authenticate_user!




  def new
    @message = current_user.sent_messages.build
    @recipient = User.find(params[:user_id])
    @messages = current_user.sent_messages.where(recipient: @recipient) # 特定の受信者に関するメッセージを取得
  end

 def create
  @message = current_user.sent_messages.build(message_params)
  @message.recipient_id = params[:message][:recipient_id]
  @recipient = User.find(@message.recipient_id) # 受信者ユーザーを取得

  if current_user.followings.include?(@recipient) && @message.save
    flash[:success] = "Message sent!"
    redirect_to new_message_path(user_id: @recipient.id)
  else
    render 'new'
  end
 end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
