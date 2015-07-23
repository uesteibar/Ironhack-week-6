class ConcertPublishMailer < ApplicationMailer

  def concert_published_mail(user, concert)
    @user = user
    @concert = concert
    mail(to: @user.email, subject: "Thanks #{@user.username}, the concert of #{@concert.band} was created!")
  end
end
