class Ability
  include CanCan::Ability

    def initialize(user)
        @user = user || User.new(:role => 'banned') # for guest

      # *Priviledge escalation* , user inherits the permissions. Default is authenticated
      if @user.role == "banned" # Also guest
        #cannot [:update, :destroy, :create], [Page] #, Comment]
        #can [:update, :destroy, :approve], [Talk] #, Comment]
        #can :manage, Bill
        can :read, [Talk, Comment, Page]
        #cannot [:update, :create], [Talk, Comment]
      end

      if @user.is? "authenticated"
        can :read, [Talk, Comment, Page]
        can [:update, :create], [Talk, Comment], :user_id => @user.id
        can [:toggle_vote], [Talk, Comment]

      end

      if @user.is? "admin"
        can :manage, :all #, Comment]
      end

    end
    # Define abilities for the passed in user here. For example:
    #
#       user ||= User.new # guest user (not logged in)
#       if user.admin?
#         can :manage, :all
#       else
#         can :read, :all
#       end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
