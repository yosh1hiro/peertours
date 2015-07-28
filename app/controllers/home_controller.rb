class HomeController < ApplicationController
  def index
    @title = "Travel Japan with Local Insiders"
  end

  def about
    @title = "About Us"
  end

  def cancellation_policies
    @title = "Cancellation Policies"
  end

  def terms
    @title = "Terms and Conditions"
  end

  def privacy
    @title = "Privacy Policy"
  end

  def help_for_travellers
    @title = "Help for Travellers"
  end

  def help_for_guides
    @title = "Help for Guides"
  end

  def how_it_works
    @title = "How it Works"
  end

  def why_peertours
    @title = "Why PeerTours?"
  end

  def why_guide
    @title = "Why Become a Guide"
  end

  def become_guide
    @title = "Become a Guide"
  end


end
