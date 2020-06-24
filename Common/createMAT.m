function createMAT(path)

% Set this path to the directory which contains data about Authenticate and Splice classes

pathd = [path, '\DataBase'];
Au_Path =strcat(pathd, '\Au');
Au = dir([Au_Path, '\*.jpg']);
Au = {Au.name};
Au = Au';
%save Authenticate;
save([path, '\MATFiles\', 'Au'], 'Au');

Sp_Path =strcat(pathd, '\sp');
Sp = dir([Sp_Path, '\*.jpg']);
Sp = {Sp.name};
Sp = Sp';
%save Spliced;
save([path, '\MATFiles\', 'Sp'], 'Sp');
clear all;

