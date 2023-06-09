require_relative '../classroom'

describe ClassRoom do
  before :each do
    @classroom = ClassRoom.new('Eight')
  end

  it 'checking classroom instance' do
    expect(@classroom).to be_instance_of ClassRoom
  end

  it 'checking attributes' do
    expect(@classroom.label).to eq('Eight')
  end

  it 'test for add student' do
    student = double('student')
    allow(student).to receive(:age) { '12' }
    allow(student).to receive(:name) { 'shubham' }
    allow(student).to receive(:parent_permission) { true }
    allow(student).to receive(:classroom=).and_return(ClassRoom)
    expect(@classroom.add_student(student).students[0].name).to eq('shubham')
  end
end
