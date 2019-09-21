require './spec/spec_helper'

RSpec.describe InvitationListMaker do
  it 'has method .matched_customers' do
    # expect(InvitationListMaker).to respond_to(:matched_customers)
  end
  
  it 'does not return customers which are too far' do
    # expect
  end
  
end

# координаты валидные
# - в пределах допустимых значений
# конвертер из строки делает флоат
#   перевод в радианы верный
# формула работает -
#   верные ответы для тестового примера
#   для одинаковых координат
#
# чтение из файла работает
#
# вывод правильно сформирован по виду
# фильтр по расстоянию работает верно
