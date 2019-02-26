class JobExperience < ApplicationRecord
"""
Rail5からbelongs_toのデフォルトが関連先の値を検査するようになった。
Rails4と同様に関連先を検査しないようにするには、belongs_toにoptional: trueを付与すれば良い。

付与しない場合のエラー:
ActiveRecord::RecordInvalid: Validation failed: Event must exist

"""
belongs_to :job, optional: true
belongs_to :company, optional: true
belongs_to :user, optional: true

def change
    add_column :user_id, :job_id, :company_id, :experience, :start_of_date, :end_of_date
end


end
