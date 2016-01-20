class Applicant < ActiveRecord::Base
	has_many: pens, dependent :destroy
end
