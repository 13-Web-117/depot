class User < ActiveRecord::Base
  after_destroy :ensure_an_admin_remains
  
  attr_accessible :name, :password_digest, :password, :password_confirmation, :permission
  validates :name, presence: true, uniqueness: true
  has_secure_password
  
  has_one :cart, dependent: :destroy
  has_many :comments, dependent: :destroy
  
    
  # def get_user_cart
    # unless cart
      # cart = Cart.create
    # end
    # cart
  # end
  
  def set_user_cart(current_cart)
    cart = current_cart
  end
  
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end
end
