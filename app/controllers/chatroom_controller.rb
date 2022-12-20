class ChatroomController < ApplicationController


def index
  @login_check=session[:username]
  @message= Messagetext.all
  @active=User.where(active: "t")
  puts "chatroom"
  @b=session[:user_id]
  
  puts "chatroom"
  if request.post?
   @msg=Messagetext.new()
   @msg.body = params[:body]
   @msg.user_id = @b
   @msg.send_date =Time.now.strftime("%a %b %Y  %I:%M %p")
   if @msg.save
    ActionCable.server.broadcast "chatroom_channel", { mod_message: message_render(@msg) }
   end

  end

end

def chat

end

def message_render (msg)
    puts "^^^^^^^^"
    @user=msg.user.username
    @body=msg.body
    @datetime=msg.send_date
    
    render(partial: 'layouts/messages')
    #render(partial: 'layouts/messages', locals: {message: @msg})
end



end
