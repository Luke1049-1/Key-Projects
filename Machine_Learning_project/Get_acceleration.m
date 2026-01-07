function [acc,act_label,time_axis] = Get_acceleration(subject, direction, subjects, fs)

if direction == 'x'
    dir = 1;
elseif direction == 'y'
    dir = 2;
elseif direction == 'z'
    dir = 3;
end
acc = subjects(subject).totalacc(:,dir);
act_label = subjects(subject).actid;
time_axis = (1:length(subjects(subject).totalacc(:,dir)))/fs;

end

