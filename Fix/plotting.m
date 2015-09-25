accuracy = accuracy';
plot3(sim_alfa(1), sim_beta, accuracy(1,:),sim_alfa(2), sim_beta, accuracy(2,:),sim_alfa(3), sim_beta, accuracy(3,:))
grid on
title('Graph of FLVQ accuracy')
xlabel('alfa') % x-axis label
ylabel('beta') % y-axis label
zlabel('accuracy')
axis([0,1,0,1,0,100])

atau

scatter3(sim_alfa, sim_beta, accuracy, 'filled');
title('Graph of FLVQ accuracy')
xlabel('alfa') % x-axis label
ylabel('beta') % y-axis label
zlabel('accuracy')
axis([0,1,0,1,0,100])

atau

surf(sim_alfa, sim_beta, accuracy);
title('Graph of FLVQ accuracy')
xlabel('alfa') % x-axis label
ylabel('beta') % y-axis label
zlabel('accuracy')
axis([0,1,0,1,0,100])

atau

mesh(sim_alfa, sim_beta, accuracy);
title('Graph of FLVQ accuracy')
xlabel('alfa') % x-axis label
ylabel('beta') % y-axis label
zlabel('accuracy')
axis([0,1,0,1,0,100])